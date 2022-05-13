$('#pt-br').click(() => {
    langbr();
});
$('#en-us').click(() => {
    langus();
});

$(function() {
  $('#ulBox').hover(function() {
    $('#subtitle').css('color', '#19d8b8');
    $('#subtitled').css('color', '#19d8b8');
    $('#ulBox').css('color', '#fff');
    $('#ulBox').css('background-color', '#044d40');
  
  }, function() {
    // on mouseout, reset the background colour
    $('#subtitle').css('color', '');
$('#subtitled').css('color', '');
$('#ulBox').css('color', '');
    $('#ulBox').css('background-color', '');
  });
});

function sendVal() {
    var cname = document.getElementById("fname").value;
    var cemail = document.getElementById("emailAddress").value;
    var cmessage = document.getElementById("subject").value;
    var msglt = document.getElementById("msgAlert").value;
    $.post("sendMessage.jsp", {
        FtName: cname,
        FtEmail: cemail,
        FtMsg: cmessage
    });
    document.getElementById("fname").value = "";
    document.getElementById("emailAddress").value = "";
    document.getElementById("subject").value = "";
    var subMsg1 = document.getElementById("submsgAlert1").value;
    var subMsg2 = document.getElementById("submsgAlert2").value;
    var subMsg = subMsg1 + " " + cname + " " + subMsg2

    swal(msglt, subMsg);
    return false;
}

window.onload = function(e) {

    AOS.init();
     var userLang = navigator.language || navigator.userLanguage;
		   var ptBr = "pt-BR"
		   if(userLang != ptBr)
		   {
			   langus();
		   }
		   else{
			   langbr();
			   
		   }

}

function langbr() {
    /*Mensagem*/
    document.getElementById("submsgAlert1").value = decodeURIComponent(escape("Obrigado"));
    document.getElementById("submsgAlert2").value = decodeURIComponent(escape(", iremos responder sua duvida o mais rapido possível"));
    document.getElementById("msgAlert").value = decodeURIComponent(escape("Mensagem Enviada com sucesso"));
    /*Menu*/
    document.getElementById("plans").innerHTML = decodeURIComponent(escape('Planos'));
    document.getElementById("tms").innerHTML = decodeURIComponent(escape("Nosso Time"));
    document.getElementById("cont").innerHTML = decodeURIComponent(escape("Contato"));
    /*Container*/
    document.getElementById("text-info").innerHTML = decodeURIComponent(escape("Sistema para controle financeiro completo, fácil de usar e com um plano gratuito"));
    /*Features*/
    document.getElementById("sup").innerHTML = decodeURIComponent(escape("Suporte"));
    document.getElementById("txtsup").innerHTML = decodeURIComponent(escape("Nos dedicamos ao seu atendimento, assim que você entra em contato, respondemos sua duvida o maisrapido possível."));
    document.getElementById("secut").innerHTML = decodeURIComponent(escape("Segurança"));
    document.getElementById("txtsuct").innerHTML = decodeURIComponent(escape("Assim que você efetua a compra e confirma o pagamento a nós, enviamos o produto a seu endereço de email."));
    document.getElementById("plansif").innerHTML = decodeURIComponent(escape("Planos"));
    document.getElementById("txtplansif").innerHTML = decodeURIComponent(escape("Nossos planos são otimos, fique de olho pois a qualquer momento podemos lançar uma promoção."));
    /*Planos*/
    document.getElementById("pds").innerHTML = decodeURIComponent(escape("Planos"));
    document.getElementById("txtseep").innerHTML = decodeURIComponent(escape("Veja e escolha nossos planos, eles já estão te esperando."));
    document.getElementById("freetxt").innerHTML = decodeURIComponent(escape("GRATUITO"));
    document.getElementById("pricefree").innerHTML = decodeURIComponent(escape('<h4><small>R$</small>00<small>,00</small></h4>'));
    document.getElementById("contpro").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Contém Propagandas'));
    document.getElementById("shre").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Mostra resultado'));
    document.getElementById("case").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Calculo Semanal'));
    document.getElementById("cacm").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-uncheck.png" alt=""/>Calculo Mensal'));
    document.getElementById("calanu").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-uncheck.png" alt=""/>Calculo Anual'));
    document.getElementById("grasf").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-uncheck.png" alt=""/>Graficos'));
    document.getElementById("dwnl").innerHTML = decodeURIComponent(escape("COMPRAR"));
    document.getElementById("pricedex").innerHTML = decodeURIComponent(escape("<h4><small>R$</small>24<small>,99</small></h4>"));
    document.getElementById("contproa").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-uncheck.png" alt=""/>Contém Propagandas'));
    document.getElementById("shrea").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Mostra resultado'));
    document.getElementById("casea").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Calculo Semanal'));
    document.getElementById("cacma").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Calculo Mensal'));
    document.getElementById("calanua").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Calculo Anual'));
    document.getElementById("grasfa").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Graficos'));
    document.getElementById("buy").innerHTML = decodeURIComponent(escape("COMPRAR"));
    document.getElementById("txtinf").innerHTML = decodeURIComponent(escape("Informações"));
    document.getElementById("adci").innerHTML = decodeURIComponent(escape("<h4><small>Adicionais</small></h4>"));
    document.getElementById("advt").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-icheck.png" alt=""/>Propagandas'));
    document.getElementById("rbg").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-icheck.png" alt=""/>Resultado por Graficos'));
    document.getElementById("clvw").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-icheck.png" alt=""/>Visão dos Calculos:'));
    document.getElementById("vswe").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-scheck.png" alt=""/>Semanal'));
    document.getElementById("vsmo").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-scheck.png" alt=""/>Mensal'));
    document.getElementById("vsann").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-scheck.png" alt=""/>Anual'));
    document.getElementById("moinf").innerHTML = decodeURIComponent(escape("Mais Informações"));
    /*Cradores*/
    document.getElementById("ttm").innerHTML = decodeURIComponent(escape("Nosso Time"));
    document.getElementById("gdp").innerHTML = decodeURIComponent(escape("Gerente de Projetos"));
    document.getElementById("mdv").innerHTML = decodeURIComponent(escape("Desenvolvedor Mobile"));
    document.getElementById("sa1").innerHTML = decodeURIComponent(escape("Analista de Sistema"));
    document.getElementById("wbd1").innerHTML = decodeURIComponent(escape("Desenvolvedor Web"));
    document.getElementById("sa2").innerHTML = decodeURIComponent(escape("Analista de Sistema"));
    document.getElementById("wbd2").innerHTML = decodeURIComponent(escape("Desenvolvedor Web"));
    /*Contato*/
    document.getElementById("ctt").innerHTML = decodeURIComponent(escape("Contato"));
    document.getElementById("fname").placeholder = decodeURIComponent(escape("Digite seu Nome"));
    document.getElementById("emailAddress").placeholder = decodeURIComponent(escape("Digite seu Email"));
    document.getElementById("subject").placeholder = decodeURIComponent(escape("Digite seu Comentário ou Mensagem"));
    document.getElementById("ctt").innerHTML = decodeURIComponent(escape("Contato"));
    document.getElementById("sumbtd").value = decodeURIComponent(escape("Enviar"));
    /*Rodape*/

    var yearNow = new Date().getFullYear();
    document.getElementById("pocr").innerHTML = decodeURIComponent(escape(" KLDV COMPANIA FICTÍCIA © " + yearNow));
    /*Others*/
    document.getElementById("en-us").classList.remove("active");
    document.getElementById("pt-br").classList.add("active");
    document.getElementById("dropdownMenuButton1").innerHTML = decodeURIComponent(escape("Português"));
    document.getElementById("pt-br").innerHTML = decodeURIComponent(escape('Português<h4 id="subtitled">Português</h4>'));
    document.getElementById("en-us").innerHTML = decodeURIComponent(escape('Inglês<h4 id="subtitle">English</h4>'));
}

function langus() {
    /*Menssage*/
    document.getElementById("submsgAlert1").value = decodeURIComponent(escape("Thank you"));
    document.getElementById("submsgAlert2").value = decodeURIComponent(escape(",we will answer your question as soon as possible."));
    document.getElementById("msgAlert").value = decodeURIComponent(escape("Message sent successfully"));
    /*Menu*/
    document.getElementById("plans").innerHTML = decodeURIComponent(escape("Plans"));
    document.getElementById("tms").innerHTML = decodeURIComponent(escape("Our Team"));
    document.getElementById("cont").innerHTML = decodeURIComponent(escape("Contact"));
    /*Container*/
    document.getElementById("text-info").innerHTML = decodeURIComponent(escape("Complete financial control system, easy to use and with a free plan"));
    /*Features*/
    document.getElementById("sup").innerHTML = decodeURIComponent(escape("Support"));
    document.getElementById("txtsup").innerHTML = decodeURIComponent(escape("We are dedicated to your service, as soon as you get in touch, we answer your question as soon as possible."));
    document.getElementById("secut").innerHTML = decodeURIComponent(escape("Security"));
    document.getElementById("txtsuct").innerHTML = decodeURIComponent(escape("As soon as you make the purchase and confirm payment to us, we send the product to your email address."));
    document.getElementById("plansif").innerHTML = decodeURIComponent(escape("Plans"));
    document.getElementById("txtplansif").innerHTML = decodeURIComponent(escape("Our plans are great, keep an eye out because at any time we can launch a promotion."));
    /*Plans*/
    document.getElementById("pds").innerHTML = decodeURIComponent(escape("Plans"));
    document.getElementById("txtseep").innerHTML = decodeURIComponent(escape("See and choose our plans, they are already waiting for you."));
    document.getElementById("freetxt").innerHTML = decodeURIComponent(escape("FREE"));
    document.getElementById("pricefree").innerHTML = decodeURIComponent(escape('<h4><small>$</small>00<small>,00</small></h4>'));
    document.getElementById("contpro").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Contains advertisements'));
    document.getElementById("shre").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Shows the result'));
    document.getElementById("case").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Weekly Calculation'));
    document.getElementById("cacm").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-uncheck.png" alt=""/>Monthly Calculation'));
    document.getElementById("calanu").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-uncheck.png" alt=""/>Annual Calculation'));
    document.getElementById("grasf").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-uncheck.png" alt=""/>Graphics'));
    document.getElementById("dwnl").innerHTML = decodeURIComponent(escape("Buy"));
    document.getElementById("pricedex").innerHTML = decodeURIComponent(escape("<h4><small>$</small>04<small>,79</small></h4>"));
    document.getElementById("contproa").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-uncheck.png" alt=""/>Contains advertisements'));
    document.getElementById("shrea").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Shows the result'));
    document.getElementById("casea").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Weekly Calculation'));
    document.getElementById("cacma").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Monthly Calculation'));
    document.getElementById("calanua").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Annual Calculation'));
    document.getElementById("grasfa").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-check.png" alt=""/>Graphics'));
    document.getElementById("buy").innerHTML = decodeURIComponent(escape("Buy"));
    document.getElementById("txtinf").innerHTML = decodeURIComponent(escape("Informations"));
    document.getElementById("adci").innerHTML = decodeURIComponent(escape("<h4><small>Additional</small></h4>"));
    document.getElementById("advt").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-icheck.png" alt=""/>Advertisements'));
    document.getElementById("rbg").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-icheck.png" alt=""/>Result by graphics'));
    document.getElementById("clvw").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-icheck.png" alt=""/>Calculation View'));
    document.getElementById("vswe").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-scheck.png" alt=""/>Weekly'));
    document.getElementById("vsmo").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-scheck.png" alt=""/>Monthly'));
    document.getElementById("vsann").innerHTML = decodeURIComponent(escape('<img src="img/Icon_awesome-scheck.png" alt=""/>Yearly'));
    document.getElementById("moinf").innerHTML = decodeURIComponent(escape("More information"));
    /*Creators*/
    document.getElementById("ttm").innerHTML = decodeURIComponent(escape("Our Team"));
    document.getElementById("gdp").innerHTML = decodeURIComponent(escape("Project Manager"));
    document.getElementById("mdv").innerHTML = decodeURIComponent(escape("Mobile Developer"));
    document.getElementById("sa1").innerHTML = decodeURIComponent(escape("System analyst"));
    document.getElementById("wbd1").innerHTML = decodeURIComponent(escape("Web developer"));
    document.getElementById("sa2").innerHTML = decodeURIComponent(escape("System analyst"));
    document.getElementById("wbd2").innerHTML = decodeURIComponent(escape("Web developer"));
    /*Contact*/
    document.getElementById("ctt").innerHTML = decodeURIComponent(escape("Contact"));
    document.getElementById("fname").placeholder = decodeURIComponent(escape("Type name here"));
    document.getElementById("emailAddress").placeholder = decodeURIComponent(escape("Type email here"));
    document.getElementById("subject").placeholder = decodeURIComponent(escape("Type your Comment or Message"));
    document.getElementById("ctt").innerHTML = decodeURIComponent(escape("Contact"));
    document.getElementById("sumbtd").value = decodeURIComponent(escape("Submit"));
    /*Footer*/
    var yearNow = new Date().getFullYear();
    document.getElementById("pocr").innerHTML = decodeURIComponent(escape(" KLDV FICTIONAL COMPANY © " + yearNow));
    /*Others*/
    document.getElementById("pt-br").classList.remove("active");
    document.getElementById("en-us").classList.add("active");
    document.getElementById("dropdownMenuButton1").innerHTML = decodeURIComponent(escape("English"));
    document.getElementById("pt-br").innerHTML = decodeURIComponent(escape('Portuguese<h4 id="subtitled">Português</h4>'));
    document.getElementById("en-us").innerHTML = decodeURIComponent(escape('English<h4 id="subtitle">English</h4>'));


}