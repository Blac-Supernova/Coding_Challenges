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
        if(speed!=null && speed >= 0){
            this.Speed = speed;
        } else{
            this.Speed = 0;
        }


        if(occupants != null && Occupants > 0){
            this.Occupants = Occupants;
        }else {
            this.Occupants = 1;
        }


        if(capacity != null && Capacity >=1){
            this.Capacity = Capacity;
        } else {
            this.capacity = 1;
        }

        if(media !=null){
            this.media = media;
        }else {
            this.media = new List<Medium>();
            this.media.add(Medium.LAND);
        }

        if(Name != null){
            this.Name = Name;
        } else {this.Name = 'Default Vehicle';}
        


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