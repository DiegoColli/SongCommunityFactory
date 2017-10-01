package com.br.superlogic.songcommunityfactory.domain.model.util;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Diego
 */
public class SummaryProject
{

    private BigInteger id;
    private String name;
    private Timestamp created;
    private BigInteger workspaces;
    private BigInteger contracts;
    private BigInteger publications;
    private BigInteger resources;

    public BigInteger getId()
    {
        return id;
    }

    public void setId(BigInteger id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public BigInteger getWorkspaces()
    {
        return workspaces;
    }

    public void setWorkspaces(BigInteger workspaces)
    {
        this.workspaces = workspaces;
    }

    public BigInteger getContracts()
    {
        return contracts;
    }

    public void setContracts(BigInteger contracts)
    {
        this.contracts = contracts;
    }

    public BigInteger getPublications()
    {
        return publications;
    }

    public void setPublications(BigInteger publications)
    {
        this.publications = publications;
    }

    public BigInteger getResources()
    {
        return resources;
    }

    public void setResources(BigInteger resources)
    {
        this.resources = resources;
    }

    public Timestamp getCreated()
    {
        return created;
    }

    public void setCreated(Timestamp created)
    {
        this.created = created;
    }

    public String getCreatedBr()
    {
        return created.toLocalDateTime().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }
}
