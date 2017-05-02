  $(function(){
$("#addClass").click(function () {
  a = document.getElementById("qnimate");
  if(a.style.display=="none"){
          $('#qnimate').addClass('popup-box-on');
          a.style.display="inline";
  }else{
        $('#qnimate').removeClass('popup-box-on');
        a.style.display="none";
  }
            });
          
            $("#removeClass").click(function () {
          $('#qnimate').removeClass('popup-box-on');
            });
  });

  