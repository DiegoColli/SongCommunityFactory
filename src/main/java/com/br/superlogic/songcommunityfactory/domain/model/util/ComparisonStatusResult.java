package com.br.superlogic.songcommunityfactory.domain.model.util;

import com.br.superlogic.songcommunityfactory.domain.model._interface.Resource;

/**
 *
 * @author Diego
 */
public class ComparisonStatusResult
{

    Resource wanted;
    
    Resource found;
    
    private ComparisonStatus status;

    public ComparisonStatus getStatus()
    {
        return status;
    }

    public void setStatus(ComparisonStatus status)
    {
        this.status = status;
    }

    public Resource getWanted()
    {
        return wanted;
    }

    public void setWanted(Resource wanted)
    {
        this.wanted = wanted;
    }

    public Resource getFound()
    {
        return found;
    }

    public void setFound(Resource found)
    {
        this.found = found;
    }

}
