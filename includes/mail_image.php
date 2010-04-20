<?php

require_once('init.php');

/* A class for retrieving images and location data from an email account */

class MailImage {

    private $mail_server = null;
    private $username = null;
    private $password = null;
    public $messages = array();

    public function __construct($mail_server, $username, $password){    
        $this->mail_server = $mail_server;
        $this->username = $username;
        $this->password = $password;
    }

    public function fetch ($delete = false) {
        $oImap = imap_open('{'. $this->mail_server.':993/imap/ssl/novalidate-cert}', $this->username, $this->password);

        $oMailboxStatus = imap_check($oImap);
        $aMessages = imap_fetch_overview($oImap, "1:{$oMailboxStatus->Nmsgs}");

        $validMessages = array();

        foreach ($aMessages as $oMessage) {
            
            print "Trying message '" . $oMessage->subject . "'";
            $fileContent = $fileType = '';
        	$geocoder = factory::create('geocoder');
            $postCode = $geocoder->extract_postcode($oMessage->subject);

            $fromName = null;
            $fromEmail = null;

            if (strpos($oMessage->from, '<')){
                $split = split('<', $oMessage->from);
                
                //name - make sure name not an email address
                $fromName = trim($split[0]);
                if(valid_email($fromName)){
                    $fromName = null;
                }
                
                //email
                $fromEmail = trim(str_replace('>', '', $split[1]));
            }else{
                $fromEmail = $oMessage->from;
            }

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

                        $oImage = null;
                            $encodedBody = imap_fetchbody($oImap, $oMessage->msgno, $partNumber);
                            $fileContent = base64_decode($encodedBody);
                            $oImage = imagecreatefromstring($fileContent);
                        
                        if (imagesx($oImage) > $this->min_import_size && imagesy($oImage) > $this->min_import_size) {
                            array_push($images, $oImage);                                                    
                        }

                        $fileType = strtolower($oPart->subtype);
                    }
                }
            }

            //add to the messages array
            array_push($validMessages, array(
                'postcode'  => $postCode,
                'images'      => $images,
                'file_type'  => $fileType,
                'from_address'  => $fromAddress,
                'from_email'  => $fromEmail,                
                'from_name'  => $fromName,
            ));

            if ($delete){
                imap_delete($oImap, $oMessage->msgno);
            }
        }

        imap_close($oImap, CL_EXPUNGE);

        $this->messages = $validMessages;
    }
}