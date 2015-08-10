// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
			

			var linha = $(this).get();
			linha.sort(function(a, b) {
				$(this).alert('fff');

			   //Armazena nas variáveis A e B o valor de duas datas do array para comparar
				var A = $(a).children('td').eq(1).text();
			    var B = $(b).children('td').eq(1).text();
			    // Retorna um valor negativo se a primeira data for maior do que a segunda
			    if(A > B) {
			     	return -1;
			    }
			    // Retorna um valor positivo se a primeira data for menor do que a segunda
			    if(A < B) {
			    	return 1;
			    }
			 });
			// Atualiza a tabela já ordenada
		    $.each(linha, function(index, linha) {
		    	$(this).children('tbody').append(linha);
		 	});



		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	}

	)(jQuery);
}
