$(document).ready(function(){
    $('#file').change(function(){
        $('#uploadForm').hide();
        $('#uploadForm').submit();
        $('#uploadProgress').show();
        $('[name=addInfo]').attr('disabled', 'disabled');
    })
})