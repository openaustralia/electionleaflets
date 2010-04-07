<?php

require_once('init.php');

/* A class for retrieving images and location data from an email account */

class MailImage {

    private $mail_server = null;
    private $username = null;
    private $password = null;
    private $min_import_size = 400;

    public function __construct($mail_server, $username, $password){    
        $self->$mail_server = $mail_server;
        $self->$username = $username;
        $self->$password = $password;
    }

    public function fetch ($delete = false) {

        $oImap = imap_open('{'. $self->mail_server.':993/imap/ssl/novalidate-cert}', $self->username, $self->password);

        $oMailboxStatus = imap_check($oImap);
        $aMessages = imap_fetch_overview($oImap, "1:{$oMailboxStatus->Nmsgs}");

        $validMessages = array();

        foreach ($aMessages as $oMessage) {
            $fileContent = $fileType = '';
            $postCode = geocoder::extract_postcode($oMessage->subject);
            $fromAddress = $oMessage->from;            
            
            $images = array();

            $messageStructure = imap_fetchstructure($oImap, $oMessage->msgno);

            if (isset($messageStructure->parts)) {
                $partNumber = 0;

                foreach ($messageStructure->parts as $oPart) {
                    $partNumber++;

                    if ($oPart->subtype == 'PLAIN' && !$postCode) {

                        $messageContent = imap_fetchbody($oImap, $oMessage->msgno, $partNumber);

                        if ($oPart->encoding == 4) {
                            $messageContent = quoted_printable_decode($messageContent);
                        }

                        $postCode = geocoder::extract_postcode($messageContent);

                    } elseif ($oPart->encoding == 3 && in_array($oPart->subtype, array('JPEG', 'PNG'))) {

                        $encodedBody = imap_fetchbody($oImap, $oMessage->msgno, $partNumber);
                        $fileContent = base64_decode($encodedBody);

                        $oImage = imagecreatefromstring($fileContent);
                        if (imagesx($oImage) < $self->min_import_size && imagesy($oImage) < $self->min_import_size) {
                            $fileContent = null;
                        }else{
                            array_push($images, $oImage);
                        }

                        $fileType = strtolower($oPart->subtype);
                    }
                }
            }

            if ($postCode && $fileContent) {
                array_push($validMessages, array(
                    'postcode'  => $postCode,
                    'images'      => $images,
                    'file_type'  => $fileType,
                    'from_address'  => $fromAddress,                    
                ));
            }

            if ($delete){
                imap_delete($oImap, $oMessage->msgno);
            }
        }

        imap_close($oImap, CL_EXPUNGE);

        return $validMessages;
    }

}