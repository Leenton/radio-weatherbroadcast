function Set-Day(){
	$Today = Get-Date
	$Day = Today.DayOfWeek
	Copy-Item "E:\TimeAndTemps\Day\"+ $Day + ".wav"  to "E:\TimeAndTemps\Playout\"
}
function Set-Time(){
    
    Write-Host "BNig GAY "


}
function Set-Temperature(){
    
    $Temperature = [math]::Round(((ConvertFrom-Json (Invoke-Webrequest "api.openweathermap.org/data/2.5/weather?q={}&appid={}")).main.temp - 273.15), 0)
   
    #$Temperature = ConvertFrom-Json $Temperature
    #$Temperature = $Temperature.main.temp
	#$Temperature = $Temperature - 273.15
    #$Temperature = [math]::Round($Temperature, 0)
    #Site Returns Temporeture in Kelvin, we minus 273.15 to convert to C° then round to nearest whole number. 

    Copy-Item "E:\TimeAndTemps\Temps\"+ $Temperature + ".wav"  to "E:\TimeAndTemps\Playout\"

}
function Set-Weather(){
    
    $Weather = (ConvertFrom-Json (Invoke-Webrequest "api.openweathermap.org/data/2.5/weather?q={}&appid={}")).weather.id
    #Something to filter down the list, as there are too many weather conditions. 
    $Temp = [String]$Weather
    if($Temp[0] -eq "2"){
        $Weather = "Thunderstorm"
    }elseif($Temp[0] -eq "3"){
        $Weather = "Drizzle"
    }elseif($Temp[0] -eq "5"){
        $Weather = "Rain"
    }elseif($Temp[0] -eq "6"){
        $Weather = "Snow"
    }elseif($Temp[0] -eq "7"){
        Switch ($Weather){
                701{
                    $Weather = "Clear Sky"
                    Break
                }711{
                    $Weather = "Few Clouds"
                    Break
                }721{
                    $Weather = "Scattered Clouds"
                    Break
                }803{
                    $Weather = "Broken Clouds"
                    Break
                }804{
                    $Weather = "Overcast Clouds"
                    Break
                }
            }
        $Weather = "Atmosphere"
    }elseif($Temp[0] -eq "8"){
        Switch ($Weather){
            800{
                $Weather = "Clear Sky"
                Break
            }801{
                $Weather = "Few Clouds"
                Break
            }802{
                $Weather = "Scattered Clouds"
                Break
            }803{
                $Weather = "Broken Clouds"
                Break
            }804{
                $Weather = "Overcast Clouds"
                Break
            }
        }
    }
    


    #Site Returns Temporeture in Kelvin, we minus 273.15 to convert to C° then round to nearest whole number. 
    Copy-Item "E:\TimeAndTemps\Condition\"+ $Weather + ".wav"  to "E:\TimeAndTemps\Playout\"

}




function Set-TimeAndTemperature(){
	Set-Day
	Set-Temperature
    Set-Time
	Set-Weather
}


