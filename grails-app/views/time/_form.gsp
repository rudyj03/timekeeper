<%@ page import="com.draco.timekeeper.Time" %>



<div class="fieldcontain ${hasErrors(bean: timeInstance, field: 'hours', 'error')} required">
	<label for="hours">
		<g:message code="time.hours.label" default="Hours" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hours" value="${fieldValue(bean: timeInstance, field: 'hours')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: timeInstance, field: 'job', 'error')} required">
	<label for="job">
		<g:message code="time.job.label" default="Job" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="job" name="job.id" from="${com.draco.timekeeper.Job.list()}" optionKey="id" required="" value="${timeInstance?.job?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: timeInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="time.user.label" default="user" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.draco.timekeeper.User.list()}" optionKey="id" required="" value="${timeInstance?.user?.id}" class="many-to-one"/>
</div>

