$(function() {

  $('.value_form').on('input', function(){   
    let data = $('.value_form').val(); 
    let profit = Math.round(data * 0.9)
   
    let fee = (data - profit)
      $('.right_bar').html(fee)
      $('.right_bar').prepend('¥') 
      $('.right_bar_2').html(profit)
      $('.right_bar_2').prepend('¥')
      $('#price').val(profit) 
      if(profit == '') {   
      $('.right_bar_2').html('');
      $('.right_bar').html('');
    }
  })



});