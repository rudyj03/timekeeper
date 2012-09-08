
<%@ page import="com.draco.timekeeper.Job" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-job" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-job" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list job">
			
				<g:if test="${jobInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="job.client.label" default="Client" /></span>
					
						<span class="property-value" aria-labelledby="client-label"><g:fieldValue bean="${jobInstance}" field="client"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="job.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${jobInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="job.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${jobInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${jobInstance?.id}" />
					<g:link class="edit" action="edit" id="${jobInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
