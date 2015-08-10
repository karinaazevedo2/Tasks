<%@ page import="tasks.Task" %>



<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="task.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" name="categoria.id" from="${tasks.Category.list()}" optionKey="id" required="" value="${taskInstance?.categoria?.id}" optionValue="nome" class="many-to-one"/>

</div>

<!--div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'complete', 'error')} ">
	<label for="complete">
		<g:message code="task.complete.label" default="Complete" />
		
	</label>
	<g:checkBox name="complete" value="${taskInstance?.complete}" />

</div-->

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'dataTarefa', 'error')} required">
	<label for="dataTarefa">
		<g:message code="task.dataTarefa.label" default="Data Tarefa" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataTarefa" precision="day"  value="${taskInstance?.dataTarefa}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="task.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${taskInstance?.descricao}"/>

</div>
