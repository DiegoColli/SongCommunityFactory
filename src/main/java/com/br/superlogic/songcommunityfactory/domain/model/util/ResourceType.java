package com.br.superlogic.songcommunityfactory.domain.model.util;

import com.br.superlogic.songcommunityfactory.domain.model._interface.Resource;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 *
 * @author Diego
 */
public class ResourceType
{
    public static String getType(Resource resource)
    {
        final Set<String> image = Stream.of(".jpg", ".png", ".bmp", ".jpeg", ".gif", ".tif")
                .collect(Collectors.toCollection(HashSet::new));
        final Set<String> html = Stream.of(".html", ".xhtml", "htm")
                .collect(Collectors.toCollection(HashSet::new));
        final Set<String> text = Stream.of(".txt", ".md", ".ini", ".csv", ".gp", ".gp2", ".gp3", ".gp4", ".gp5", ".gp6")
                .collect(Collectors.toCollection(HashSet::new));
        final Set<String> video = Stream.of(".avi", ".ogg", ".webm", ".mp4", ".mpg")
                .collect(Collectors.toCollection(HashSet::new));
        final Set<String> audio = Stream.of(".mid", ".mp3", ".wma", ".ogg", ".wav")
                .collect(Collectors.toCollection(HashSet::new));
        final Set<String> pdf = Stream.of(".pdf")
                .collect(Collectors.toCollection(HashSet::new));
        final Set<String> object = Stream.of(".doc", ".ppt", ".xls", ".docx", ".xlsx")
                .collect(Collectors.toCollection(HashSet::new));

        if (image.contains(resource.getExt().toLowerCase()))
        {
            return "image";
        }
        if (html.contains(resource.getExt().toLowerCase()))
        {
            return "html";
        }
        if (text.contains(resource.getExt().toLowerCase()))
        {
            return "text";
        }
        if (video.contains(resource.getExt().toLowerCase()))
        {
            return "video";
        }
        if (audio.contains(resource.getExt().toLowerCase()))
        {
            return "audio";
        }
        if (pdf.contains(resource.getExt().toLowerCase()))
        {
            return "pdf";
        }
        if (object.contains(resource.getExt().toLowerCase()))
        {
            return "object";
        }

        return "other";
    }
    
}
