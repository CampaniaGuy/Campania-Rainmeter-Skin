function Initialize()
	MeasureMail1Second = SKIN:GetMeasure('DayTimestamp')
end

function Update()
	local UTC             = os.date('!*t')
	local LocalTime       = os.date('*t')
	local DaylightSavings = LocalTime.isdst and 3600 or 0
	local LocalOffset     = os.time(LocalTime) - os.time(UTC) + DaylightSavings

	local t = {
		year  = MeasureMail1Year:GetStringValue(),
		month = MeasureMail1Month:GetStringValue(),
		day   = MeasureMail1Day:GetStringValue(),
		hour  = MeasureMail1Hour:GetStringValue(),
		min   = MeasureMail1Minute:GetStringValue(),
		sec   = MeasureMail1Second:GetStringValue(),
	}

	return os.time(t) + 11644473600 + 2 * LocalOffset