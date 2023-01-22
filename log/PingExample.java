// https://stackoverflow.com/questions/11506321/how-to-ping-an-ip-address
// https://openhome.cc/Gossip/JavaGossip-V2/InetAddress.htm
import java.net.*;
public class PingExample {
    public static void main(String[] args){
        try{
            InetAddress address = InetAddress.getByName("127.0.0.1");
            boolean reachable = address.isReachable(10000);

            System.out.println("Is host reachable? " + reachable);
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
