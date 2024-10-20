-- Version checker
Citizen.CreateThread(function()
	Citizen.Wait(2000)

	local resourceName = GetCurrentResourceName()
	local currentVersion = GetResourceMetadata(resourceName, "version", 0)

	PerformHttpRequest("https://api.github.com/repos/chaixshot/weaponselecter/releases/latest", function(errorCode, resultData, resultHeaders)
		if errorCode == 200 then
			local data = json.decode(resultData)
			local updateVersion = currentVersion
			if currentVersion ~= data.tag_name then
				updateVersion = data.tag_name
			end

			if updateVersion ~= currentVersion then
				local function Do()
					print("\n^0--------------- "..resourceName.." ---------------")
					print("^3"..resourceName.."^7 update available")
					print("^1✗ Current version: "..currentVersion)
					print("^2✓ Latest version: "..updateVersion)
					print("^5https://github.com/chaixshot/weaponselecter/releases/latest")
					if data.body then
						print("^3Changelog:")
						print("^7"..data.body)
					end
					print("^0--------------- "..resourceName.." ---------------\n")
					Citizen.SetTimeout(10 * 60 * 1000, Do)
				end
				Do()
			end
		end
	end)
end)
