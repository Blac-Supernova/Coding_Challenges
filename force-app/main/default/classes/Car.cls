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

    public override void Turn(String direction, Integer degrees) {
        if (direction != null && degrees != null) {
            Integer steeringDegreeChange = 0;
            Integer tireDegreeChange = 0;

            if (direction.toLowerCase() == 'left' || direction.toLowerCase() == 'right') {
                steeringDegreeChange = degrees;
                tireDegreeChange = Math.round(degrees / 16);
            }

            setSteeringRotation(this.steeringRotation + steeringDegreeChange);
            setTireRotation(this.tireRotation + tireDegreeChange);

            System.debug('The car is turning ' + direction + ' by ' + degrees + ' degrees.');
            System.debug('Steering Rotation: ' + this.steeringRotation + ', Tire Rotation: ' + this.tireRotation);
        }
    }
}