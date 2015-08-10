
<%@ page import="tasks.Task" %>
<%@ page import="tasks.Category" %>
<!DOCTYPE html>
<html>
	<head>
		<asset:javascript src="jquery.js" />
		<meta name="layout" content="main">
		<g:set var="tarefa" value="${message(code: 'task.label', default: 'Task')}" />
		<g:set var="count"/>
		<g:set var="categoria" value="${message(code: 'category.label', default: 'Category')}" />
		<title><g:message code="default.list.label" args="[tarefa]" /></title>
	</head>
	<body>
		<header>
			<span>Lista de Tarefas</span>
		</header>
		<main id="taskPage">
			<section>
			<div id="addTask" >
			</div>
				<div id="list-task" class="content scaffold-list" role="main">

					<table id="tblTasks">
					<colgroup>
						<col width="40%">
						<col width="15%">
						<col width="15%">
						<col width="30%">
					</colgroup>
					<thead>
							<tr>

								<th><g:message code="task.descricao.label" default="Descrição" /></th>

								<th><g:message code="Deadline" /></th>
							
								<th><g:message code="task.categoria.label" default="Categoria" /></th>

								<th><g:message code="task.categoria.label" default="Ações" /></th>
							
							
							</tr>
						</thead>
						<tbody>
						<g:each in="${taskInstanceList}" status="i" var="taskInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								
								<td class="${!taskInstance.complete ? 'normal' : 'taskCompleted'}">${fieldValue(bean: taskInstance, field: "descricao")}</td>

								<td class="${!taskInstance.complete ? 'normal' : 'taskCompleted'}"><g:formatDate format="yyyy-MM-dd" date="${taskInstance.dataTarefa}" /></td>
							
								<td class="${!taskInstance.complete ? 'normal' : 'taskCompleted'}"><g:link action="index" controller="Category" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "categoria.nome")}</g:link></td>

								<td>
									<nav>
										<g:if test="${!taskInstance.complete}">
											<g:remoteLink action="edit" id="${taskInstance.id}"  update="addTask" > 
											<g:message code="Editar" />
											</g:remoteLink>&nbsp;
											<g:link action="changeComplete" id="${taskInstance.id}"> <g:message code="Completar" />	</g:link>											
										</g:if>&nbsp;

										<a href="" onclick="<g:remoteFunction action='delete' method='DELETE' id='${taskInstance.id}'/>" >Excluir </a>

									</nav>
								</td> 
							
								<!--td><g:formatBoolean boolean="${taskInstance.complete}" /></td-->
							</tr>
						</g:each>
						<script>
							//Deixa em destaque as tarefas que já passaram do prazo e que estão próximas do prazo
							jQuery(function deadline() {
									$('#tblTasks tbody tr').each(function(i){
									var dataTarefa = jQuery($('#tblTasks tbody tr td:nth-child(2)')[i]).text();
									var dataFormatada = new Date();
									dataFormatada.setYear(dataTarefa.split("-")[0]);
									dataFormatada.setMonth(dataTarefa.split("-")[1]  - 1);
									dataFormatada.setDate(dataTarefa.split("-")[2]);
									
							        var hoje  = new Date();
							        
							        var diferenca = dataFormatada.getTime() - hoje.getTime();
							        var diferenca = Math.floor(diferenca / (1000 * 60 * 60 * 24));
							        
							        if(diferenca <=5 && diferenca >=0)
						        		jQuery($('#tblTasks tbody tr td:nth-child(2)')[i]).parent().addClass('warning');
						        	
							        if(diferenca < 0)
						        		jQuery($('#tblTasks tbody tr td:nth-child(2)')[i]).parent().addClass('overdue');
									});
								}),
								//ordena as tarefas pela data
								jQuery(function sorTable() {
								
									//Cria um array com as linhas da tabela
									var linha = $('#tblTasks tbody  tr').get();
									linha.sort(function(a, b) {

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
									    	$('#tblTasks').children('tbody').append(linha);
									 	});
								}),
								//Deixa a tarefa em negrito
								jQuery($(taskPage).find('tbody tr  td:nth-child(1), td:nth-child(2), td:nth-child(3)').click(function(evt) {

									jQuery($(evt.target )).closest('td').siblings( ).andSelf( ).toggleClass( 'rowHighlight');
										
								}))							
						</script>
					</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${taskInstanceCount ?: 0}" />
					</div>
					<nav>
					<div class="nav">
						<g:remoteLink class="create" action="create" update="addTask">
							<g:message code="Adicionar Tarefa" />
						</g:remoteLink>&nbsp;
						<g:link class="create" controller='Category' action="index"><g:message code="Adicionar Categoria" /></g:link>
					</nav>
				</div>
			</section>
		</main>
		<div class="footer" role="contentinfo">Você tem <g:message code='${Task.countByComplete("false")}' /> tarefas</div>
		
	</body>
</html>
