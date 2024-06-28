public with sharing class Vehicle {
    public enum Medium {
        LAND, AIR, WATER
    }
    private Integer Speed;
    private String Name;
    private Integer Occupants;
    public static final Integer Capacity = 4;
    // Because static constants can only be assigned upon declaration, adding a validation statement would be redundant.
    protected List<Medium> media;
    public Vehicle(Integer speed, String Name, Integer Occupants, List<Medium> media) {
        if(speed > 0){
            this.Speed = speed;
        }
        if(Occupants > 0){
            this.Occupants = Occupants;
        }
        this.media = media;
        this.Name = Name;  


    }
    //Read-only Getter method for speed
    public Integer getSpeed(){
        return Speed;
    }
    //Read-only Getter method for speed
    public String getName(){
        return Name;
    }
}