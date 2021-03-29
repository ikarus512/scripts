import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
class Print {
    private static Path path = Paths.get("C:\\p\\nism-gui-installer\\log1.txt");
    private static final String NEW_LINE = System.lineSeparator();
    public static void print(String content) {
        try {
            Files.write(path, content.getBytes(StandardCharsets.UTF_8), StandardOpenOption.CREATE, StandardOpenOption.APPEND);
        } catch(IOException e) {}
    }
}
