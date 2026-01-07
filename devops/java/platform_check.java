public class PlatformDetector {

    public static void main(String[] args) {
        // Get the operating system name
        String osName = System.getProperty("os.name");
        // Get the operating system architecture
        String osArch = System.getProperty("os.arch");
        // Get the operating system version
        String osVersion = System.getProperty("os.version");

        // Print the detected platform information
        System.out.println("Operating System Name: " + osName);
        System.out.println("Operating System Architecture: " + osArch);
        System.out.println("Operating System Version: " + osVersion);

        // Determine the type of operating system
        if (osName.toLowerCase().contains("win")) {
            System.out.println("Platform: Windows");
        } else if (osName.toLowerCase().contains("mac")) {
            System.out.println("Platform: Mac OS");
        } else if (osName.toLowerCase().contains("nix") || osName.toLowerCase().contains("nux") || osName.toLowerCase().contains("aix")) {
            System.out.println("Platform: Unix/Linux");
        } else {
            System.out.println("Platform: Unknown");
        }
    }
}
