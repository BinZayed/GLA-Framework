RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
	local source = tonumber(source)
  	local salary = math.random(50,200)
	TriggerEvent('f:getPlayer', source, function(user)
		if user ~= nil then
			local j = user.getJobData()
			if j.name == "Police" then
				local isInService = user.getSessionVar('policeInService')
				if isInService then
					salary = salary + j.pay.on		    		
		    	else
		    		salary = salary + j.pay.off		    		
		    	end
			elseif j.name == "Emergency" then
				local isInService = user.getSessionVar('paramedicInService')
				if isInService then
					salary = salary + j.pay.on		    		
		    	else
		    		salary = salary + j.pay.off		    		
		    	end
			else
				salary = salary + j.pay		    	
		 	end
		 	user.addBank(salary)
		 	TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "~g~$~s~Salary received : + "..salary.."")
	 	end
	end)
end)