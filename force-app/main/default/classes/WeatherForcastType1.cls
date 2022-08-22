public class WeatherForcastType1 implements WeatherService {

    Double temperature = 40.2;

    public Double getTemperatureInCelsius() {
        //Fetch Temperature from Weather API# 1
        return temperature; 
    }
    
    public Double getTemperatureInFarhenheit() {
         //Fetch Temperature from Weather API# 1
         return temperature; 
    }
}