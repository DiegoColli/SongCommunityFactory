
package com.br.superlogic.songcommunityfactory.domain.model._interface;

/**
 *
 * @author Diego
 */
public interface Resource {

    public Long getId();

    public String getName();

    public String getPath();
    
    public byte[] getBytes();
    
    public String getExt();
    
    public String getAppPath();
    
    public String getType();
}
