public with sharing class Vehicle {
    public enum Medium {
        LAND, AIR, WATER
    }
    private Integer Speed;
    private String Name;
    private Integer Occupants;
    private final Integer Capacity;
    protected List<Medium> media;
    public Vehicle(Integer speed, String Name, Integer Occupants, Integer Capacity, List<Medium> media) {
        if(speed > 0){
            this.Speed = speed;
        }
        if(Occupants > 0){
            this.Occupants = Occupants;
        }
        if(Capacity >=1){
            this.Capacity = Capacity;
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