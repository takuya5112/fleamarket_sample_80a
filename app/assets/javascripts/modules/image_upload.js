
$(function(){


 $(document).on('click', '.image_upload', function() {

  var preview = $('<div class="image-preview__wrapper"><img class="preview"></div><div class="image-preview_btn"><div class="image-preview_btn_delete">削除</div></div>'); 

  let append_input = $(`<li class="input"><label class="upload-label"><div class="upload-label__area"><div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`)

    $ul = $('#previews')
    $li = $(this).parents('li');
    $label = $(this).parents('.upload-label');
    $inputs = $ul.find('.image_upload');

    $('.image_upload').on('change', function (e) {

      let reader = new FileReader();



      reader.readAsDataURL(e.target.files[0]);

      
      reader.onload = function(e){
        $(preview).find('.preview').attr('src', e.target.result);
      }

      
      $li.append(preview);

    
      $label.css('display','none'); 
      $li.removeClass('input');    
      $li.addClass('image-preview'); 
      $lis = $ul.find('.image-preview'); 
      $('#previews li').css({
        'width': `110px`,
        'height': '119px'
      })
      if($lis.length <= 4 ){
        $ul.append(append_input)
        $('#previews li:last-child').css({
          'width': `calc(100% - (20% * ${$lis.length}))`
        })
      }
      else if($lis.length == 5 ){
        $li.addClass('image-preview');
        $ul.append(append_input)
        $('#previews li:last-child').css({
          'width': `100%`
        })
      }
      
      else if($lis.length <= 9 ){
        $li.addClass('image-preview');
        $ul.append(append_input)
        $('#previews li:last-child').css({
          'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
        })
      }

      $inputs.each( function( num, input ){
        $(input).removeAttr('image');
        $(input).attr({
          name:"item[item_images_attributes][" + num + "][image]",
          id:"item_images_attributes_" + num + "_image"
        });
      });
    })
   });

   $(document).on('click','.image-preview_btn_delete',function(){
    var append_input = $(`<li class="input"><label class="upload-label"><div class="upload-label__text"><div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`)
    $ul = $('#previews')
    $lis = $ul.find('.image-preview');
    $input = $ul.find('.input');
    $ul = $('#previews')
    $li = $(this).parents('.image-preview');
  
  

    $li.remove();
  
  
    $lis = $ul.find('.image-preview');
    $label = $ul.find('.input');
    if($lis.length <= 4 ){
      
      $('#previews li:last-child').css({
        'width': `calc(100% - (20% * ${$lis.length}))`
      })
    }
    else if($lis.length == 5 ){
      
      $('#previews li:last-child').css({
        'width': `100%`
      })
    }
    else if($lis.length < 9 ){
      
      $('#previews li:last-child').css({
        'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
      })
    }
    else if($lis.length == 9 ){
      $ul.append(append_input) 
      $('#previews li:last-child').css({
        'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
      })
    }
  });
  

 });


