public class Car extends Vehicle {
    private integer SteeringRotation;
    private integer TireRotation;
    private integer Gear;

    public Car(Integer SteeringRotation, Integer TireRotation, Integer Gear) {
        if(SteeringRotation != null && SteeringRotation >= -1440 && SteeringRotation <= 1440){
            this.SteeringRotation = SteeringRotation;
        } else{this.SteeringRotation = 0;}
        
        if(TireRotation != null && TireRotation >= -90 && TireRotation <= 90){
            this.TireRotation = TireRotation;
        } else{this.TireRotation = 0;}

        if(Gear != null && Gear > 0 && Gear <= 6){
            this.Gear = Gear;
        } else{this.Gear = 1;}


    }

    public Integer getTireRotation(){
        return TireRotation;
    }
    public Integer getGear(){
        return Gear;
    }
}