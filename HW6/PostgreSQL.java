import java.sql.*;
import java.util.Scanner;
import java.io.*;

/**
 * CS 3810 Fall 2017
 * This Java program interfaces with a PostgreSQL database where it reads, writes,
 * and outputs data. See the enclosed README file for instructions on how to use.
 *
 * Author: Hoyt Andres
 */

public class PostgreSQL {

    static String username, password, firstName, lastName, street, city, state, zip, country, phone, email;
    static int flightNumber = 0;
    static Scanner input = new Scanner(System.in);
    static Connection conn = null;
    static ResultSet rs = null;
    static Statement stmt = null;

    public static void main(String[] args) throws Exception {
        getCustomerData();
        insertCustomerData();
        chooseFlight();
        getConfirmation();
    }

    private static void openConnection() {
        try {
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres",
                    username, password);
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println(e.getClass().getName()+": "+e.getMessage());
            System.exit(0);
        }
    }

    private static void insertCustomerData() {
        try {
            openConnection();
            conn.setAutoCommit(false);
            stmt = conn.createStatement();
            int areaCode = Integer.valueOf(phone.substring(1,4));
            String localNumber = phone.substring(5,13);
            String insertPhone = "INSERT INTO Customers (First_name, Last_name, Street, City, State, Zip," +
                    " Country, Country_code, Area_code, Local_number, Email1) VALUES ('"+firstName+"', '"+lastName+"', " +
                    "'"+street+"', '"+city+"', '"+state+"', '"+zip+"', '"+country+"', '"+1+"', '"+areaCode+"', '"+
                    localNumber+"', '"+email+"')";
            stmt.executeUpdate(insertPhone);
            stmt.close();
            conn.commit();
            conn.close();
        } catch (SQLException e) {
            System.err.println( e.getClass().getName()+": "+ e.getMessage() );
            System.exit(0);
        }
    }

    private static void getCustomerData() throws IOException {
        FileWriter fileWriter = new FileWriter("HW6.error", true);
        PrintWriter printWriter = new PrintWriter(fileWriter);
        System.out.println("Before we start, we need your PostgreSQL login information.");
        System.out.print("Username: ");
        username = input.nextLine();
        System.out.print("Password: ");
        password = input.nextLine();
        System.out.println("Welcome to the Flight Reservation System! Let's get your information");
        System.out.print("First name: ");
        firstName = input.nextLine();
        System.out.print("Last name: ");
        lastName = input.nextLine();
        System.out.print("Street address (do not include city, state, or zip): ");
        street = input.nextLine();
        System.out.print("City: ");
        city = input.nextLine();
        System.out.print("State Abbreviation: ");
        state = input.nextLine();
        System.out.print("5 digit zip code: ");
        zip = String.valueOf(Integer.parseInt(input.nextLine()));
        int zipLength = Integer.valueOf(zip).toString().length();
        if (zipLength != 5) {
            System.out.println("Sorry, that's an invalid zip code. Please restart the program.");
            printWriter.println("Customer " + lastName + ", " + firstName + " had invalid zip code " + zip);
            printWriter.close();
            System.exit(0);
        }
        System.out.print("Country: ");
        country = input.nextLine();
        System.out.print("Phone number in the format (xxx)xxx-xxxx: ");
        phone = input.nextLine();
        if (!(phone.length() == 13 && phone.charAt(0) == '(' && phone.charAt(4) == ')'
                && phone.charAt(8) == '-')) {
            System.out.println("Sorry, that's an invalid phone number format. Please restart the program.");
            printWriter.println("Customer " + lastName + ", " + firstName + " had invalid phone number " + phone);
            printWriter.close();
            System.exit(0);
        }
        System.out.print("Email address:");
        email = input.nextLine();
        if (!(email.contains("@"))) {
            System.out.println("Sorry, that's not a valid email address. Please restart the program.");
            printWriter.println("Customer " + lastName + ", " + firstName + " had invalid email " + email);
            printWriter.close();
            System.exit(0);
        }
    }

    private static void chooseFlight() {
        System.out.print("From what city would your flight originate?: ");
        String origin = input.nextLine();
        try {
            openConnection();
            conn.setAutoCommit(false);
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM Flights WHERE (origin = '"+origin+"')");
            if (!rs.isBeforeFirst()) {
                System.out.println("Sorry, that's not a valid origin city, please restart program.");
                System.exit(0);
            } else {
                System.out.println("Here is a list of flights that originate in " + origin);
                System.out.println("-------------------------------------------------------------");
            }
            while (rs.next()) {
                String airline = rs.getString("Airline");
                int flightNumber = rs.getInt("Flight_number");
                String originCity = rs.getString("Origin");
                String destination = rs.getString("Destination");
                System.out.println(airline + " flight " + flightNumber + " flies from " + originCity + " to " +
                        destination);
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            System.err.println( e.getClass().getName()+": "+ e.getMessage() );
            System.exit(0);
        }
        int counter = 0;
        do {
            System.out.print("Choose a destination city from the above list: ");
            String destCity = input.nextLine();
            try {
                openConnection();
                conn.setAutoCommit(false);
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM Flights WHERE (origin = '" + origin + "' AND destination = '"
                        + destCity + "')");
                if (!rs.isBeforeFirst()) {
                    System.out.print("Sorry, that's not a valid destination. ");
                    counter++;
                    if (counter == 3) {
                        System.out.println("Maximum attempts reached, goodbye!");
                        rs.close();
                        stmt.close();
                        conn.close();
                        System.exit(0);
                    }
                } else {
                    rs.next();
                    flightNumber = rs.getInt("Flight_number");
                    break;
                }
            } catch (SQLException e) {
                System.err.println(e.getClass().getName() + ": " + e.getMessage());
                System.exit(0);
            }
        } while (counter < 3);
        try {
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
    }

    private static void getConfirmation() throws IOException {
        FileWriter fileWriter = new FileWriter("HW6.flight", true);
        PrintWriter printWriter = new PrintWriter(fileWriter);

        try {
            openConnection();
            conn.setAutoCommit(false);
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM Flights WHERE Flight_number = "+flightNumber+"");
            rs.next();
            String airline = rs.getString("Airline");
            String origin = rs.getString("Origin");
            String destination = rs.getString("Destination");
            String departDate = rs.getString("Departure_date");
            String departTime = rs.getString("Departure_time");
            String arrivalTime = rs.getString("Arrival_time");
            String flightLength = rs.getString("Flight_length");
            String confirmation = "";
            confirmation += "Customer Information \n";
            confirmation += "--------------------------\n";
            confirmation += "Name: "+ firstName + " " + lastName + "\n";
            confirmation += "Address: " + street + ", " + city + ", " + state + ", " +
                    zip + "\n";
            confirmation += "Phone: " + phone + "\n";
            confirmation += "Email: " + email + "\n\n";
            confirmation += "Flight Information \n";
            confirmation += "--------------------------\n";
            confirmation += "Airline: " + airline + "\n";
            confirmation += "Flight number: " + flightNumber + "\n";
            confirmation += "Departing from: " + origin + "\n";
            confirmation += "Destination: " + destination + "\n";
            confirmation += "Date of Departure: " + departDate + "\n";
            confirmation += "Time of Departure: " + departTime + "\n";
            confirmation += "Arrival Time: " + arrivalTime + "\n";
            confirmation += "Length of Flight: " + flightLength;
            printWriter.println(confirmation);
            String insertReservation = "INSERT INTO Reservations (Customer_name, Flight_number, Date, Origin, " +
                    "Destination, Departure_time, Arrival_time) VALUES('"+firstName+ " " +lastName+"', "
                    +flightNumber+", '"+java.time.LocalDate.now()+"', '"+origin+"', '"+destination+"', '"
                    +departTime+"', '"+arrivalTime+"')";
            stmt.executeUpdate(insertReservation);
            rs.close();
            stmt.close();
            printWriter.close();
            conn.commit();
            conn.close();
            System.out.println("Congratulations! Below is your confirmation.");
            System.out.println();
            System.out.println(confirmation);
            System.out.println();
            System.out.println("Your confirmation has also been saved to the HW6.flight file");
        } catch (SQLException e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
    }
}
