Config = {}

Config.Locale = 'de' -- Either 'en' or 'de'

Config.Wait = 5000 -- Seconds to wait till player will be kicked out of the car

-- List of police cars (Spawn names)
Config.CopCars = {
    GetHashKey("police"),
    GetHashKey("police2"),
    GetHashKey("police3"),
}

-- List of ambulance cars (Spawn names)
Config.AmbulanceCars = {
    GetHashKey("ambulance")
}