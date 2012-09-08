
<%@ page import="com.draco.timekeeper.Time" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'time.label', default: 'Time')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-time" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-time" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="hours" title="${message(code: 'time.hours.label', default: 'Hours')}" />
					
						<th><g:message code="time.job.label" default="Job" /></th>
					
						<th><g:message code="time.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${timeInstanceList}" status="i" var="timeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${timeInstance.id}">${fieldValue(bean: timeInstance, field: "hours")}</g:link></td>
					
						<td>${fieldValue(bean: timeInstance, field: "job")}</td>
					
						<td>${fieldValue(bean: timeInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${timeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
