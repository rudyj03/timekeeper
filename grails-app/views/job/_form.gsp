<%@ page import="com.draco.timekeeper.Job" %>



<div class="fieldcontain ${hasErrors(bean: jobInstance, field: 'client', 'error')} ">
	<label for="client">
		<g:message code="job.client.label" default="Client" />
		
	</label>
	<g:textField name="client" value="${jobInstance?.client}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jobInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="job.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${jobInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jobInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="job.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${jobInstance?.title}"/>
</div>

