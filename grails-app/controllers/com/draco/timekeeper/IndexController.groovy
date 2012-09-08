package com.draco.timekeeper

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class IndexController 
{
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def index()
	{
		
	}
}
