public class Car extends Vehicle {
    private integer SteeringRotation;
    private integer TireRotation;

    public Car() {

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
}