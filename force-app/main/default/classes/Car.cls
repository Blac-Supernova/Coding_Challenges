public class Car extends Vehicle {
    private integer SteeringRotation;
    private integer TireRotation;
    private String Gear;

    public Car(Integer speed, String name, Integer occupants, Integer capacity, List<Medium> media, Integer steeringRotation, Integer tireRotation, String gear) {
        super(speed, name, occupants, capacity, media);
        initializeCar(steeringRotation, tireRotation, gear);
    }

        //Default values for car related actions
    public Car(Integer Speed, String Name, Integer Occupants, Integer Capacity, List<Medium> media, Integer SteeringRotation, Integer TireRotation, String Gear) {
        super(Speed, Name, Occupants, Capacity, new List<Medium>{Medium.LAND});
        this.SteeringRotation = 0;
        this.TireRotation = 0;
        this.Gear = 'N';

    }

    private void initializeCar(Integer steeringRotation, Integer tireRotation, String gear) {
        this.SteeringRotation = (steeringRotation != null && steeringRotation >= -1440 && steeringRotation <= 1440) ? steeringRotation : 0;
        this.TireRotation = (tireRotation != null && tireRotation >= -90 && tireRotation <= 90) ? tireRotation : 0;
        this.Gear = (gear != null) ? gear : calculateGear(getSpeed());
    }


    public Integer getTireRotation(){
        return TireRotation;
    }
    public String getGear(){
        return Gear;
    }

    public override Integer accelerate(Integer speedChange) {
        Integer newSpeed = super.accelerate(speedChange);
        this.Gear = calculateGear(newSpeed);
        return newSpeed;
    }

    private String calculateGear(Integer speed) {
        return String.valueOf((Integer)Math.ceil(0.4444 * (Math.sqrt(speed))));
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