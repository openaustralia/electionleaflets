$(document).ready(function(){
    $('[name=addInfo]').click(function(){window.location="/addinfo.php";return false;});
    $('#file').change(function(){
        $('#uploadForm').hide();
        $('#uploadForm').submit();
        $('#uploadProgress').show();
        $('[name=addInfo]').attr('disabled', 'disabled');
    })
})