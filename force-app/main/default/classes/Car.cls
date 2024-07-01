public class Car extends Vehicle {
    private integer SteeringRotation;
    private integer TireRotation;
    private String Gear;

    public Car(Integer Speed, String Name, Integer Occupants, Integer Capacity, List<Medium> media, Integer SteeringRotation, Integer TireRotation, String Gear) {
        super(Speed, Name, Occupants, Capacity, new List<Medium>{Medium.LAND});
        this.SteeringRotation = 0;
        this.TireRotation = 0;
        this.Gear = 'N';

    }

    private void setSteeringRotation(Integer SteeringRotation){
        if(SteeringRotation != null && SteeringRotation >= -1440 && SteeringRotation <= 1440){
            this.SteeringRotation = SteeringRotation;
        } else{this.SteeringRotation = 0;}
    }

    private void setTireRotation(Integer TireRotation){
        if(TireRotation != null && TireRotation >= -90 && TireRotation <= 90){
            this.TireRotation = TireRotation;
        } else{this.TireRotation = 0;}
    }

    public Integer getTireRotation(){
        return TireRotation;
    }
    public String getGear(){
        return Gear;
    }
}