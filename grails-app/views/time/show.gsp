
<%@ page import="com.draco.timekeeper.Time" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'time.label', default: 'Time')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-time" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-time" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list time">
			
				<g:if test="${timeInstance?.hours}">
				<li class="fieldcontain">
					<span id="hours-label" class="property-label"><g:message code="time.hours.label" default="Hours" /></span>
					
						<span class="property-value" aria-labelledby="hours-label"><g:fieldValue bean="${timeInstance}" field="hours"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${timeInstance?.job}">
				<li class="fieldcontain">
					<span id="job-label" class="property-label"><g:message code="time.job.label" default="Job" /></span>
					
						<span class="property-value" aria-labelledby="job-label"><g:link controller="job" action="show" id="${timeInstance?.job?.id}">${timeInstance?.job?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${timeInstance?.employee}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="time.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="employee" action="show" id="${timeInstance?.employee?.id}">${timeInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${timeInstance?.id}" />
					<g:link class="edit" action="edit" id="${timeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
