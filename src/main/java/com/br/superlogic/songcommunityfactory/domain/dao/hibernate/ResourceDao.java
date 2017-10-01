package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import static java.nio.file.StandardCopyOption.REPLACE_EXISTING;

/**
 *
 * @author Diego
 */
public class ResourceDao
{

    public static void createDirsIfNotExist(String pathStr) throws IOException
    {
        Path path = Paths.get(pathStr);
        //if directory exists?
        if (!Files.exists(path))
        {
            Files.createDirectories(path);
        }
    }

    public static void move(String from, String to) throws IOException
    {
        File f = new File(from);
        Files.move(f.toPath(), Paths.get(to), REPLACE_EXISTING);
    }

    public static void write(String path, byte[] bytes) throws IOException
    {
        Path filePath = Paths.get(path);
        Files.write(filePath, bytes);
    }

    public static void erase(String path) throws IOException
    {
        File f = new File(path);
        Files.deleteIfExists(f.toPath());
    }

    static void copy(String from, String to) throws IOException
    {
        File f = new File(from);
        Files.copy(f.toPath(), Paths.get(to), REPLACE_EXISTING);
    }

}
