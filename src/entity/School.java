package entity;

public class School {
	private String school_name;
    private String School_properties;
    private String Areas;
    private String Founded_time;
    
    void Student(String Name, String Sex, String Age) {
        this.school_name = school_name; //default
        this.School_properties = School_properties;
        this.Areas = Areas;
        this.Founded_time = Founded_time;
    }

    public String get_school_name() {
        return school_name;
    }
	public void set_school_name(String school_name) {
		this.school_name = school_name;
	}

}
