
<%@ page import="tasks.Category" %>
<!DOCTYPE html>
<html>
	<head>
		<asset:javascript src="jquery.js" />
		<meta name="layout" content="main">
		<g:set var="tarefa" value="${message(code: 'task.label', default: 'Task')}" />
		<g:set var="categoria" value="${message(code: 'category.label', default: 'Category')}" />
		<title><g:message code="default.list.label" args="[categoria]" /></title>
	</head>
	<body>
		<header>
			<span>Categorias</span>
		</header>
			<main id="taskPage">
			<section>
			<div id="addCategory" ></div>
			<div id="list-category" class="content scaffold-list" role="main">

				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>

				<table align="center">
				<colgroup>
						<col width="85%">
						<col width="15%">
						
					</colgroup>
				<thead>
						<tr>
							<g:sortableColumn property="nome" title="${message(code: 'category.nome.label', default: 'Nome')}" />
							
							<th><g:message code="task.categoria.label" default="Ações" /></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${categoryInstanceList}" status="i" var="categoryInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${categoryInstance.id}">${fieldValue(bean: categoryInstance, field: "nome")}</g:link></td>

							<td>
								<nav align="center">
									<g:remoteLink action="edit" id="${categoryInstance.id}"  update="addCategory" > 
									<g:message code="Editar" />
									</g:remoteLink>&nbsp;
									<!--a href="" onclick="<g:remoteFunction action='delete' method='DELETE' id='${categoryInstance.id}'/>" >Excluir</a-->

									</nav>
								</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${categoryInstanceCount ?: 0}" />
				</div>
				<nav>
					<g:remoteLink class="create" action="create" update="addCategory">
						<g:message code="Nova Categoria" />
					</g:remoteLink>&nbsp;
					<g:link class="create" controller='Task' action="index"><g:message code="Tarefas"  /></g:link>
				</nav>
			</div>
			</section>
		</main>
		<div class="footer" role="contentinfo"></div>
	</body>
</html>
