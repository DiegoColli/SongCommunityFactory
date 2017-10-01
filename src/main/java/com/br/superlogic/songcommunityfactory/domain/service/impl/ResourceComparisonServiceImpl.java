package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.dao.WorkspaceDao;
import com.br.superlogic.songcommunityfactory.domain.model.util.ComparisonStatus;
import com.br.superlogic.songcommunityfactory.domain.model.util.ComparisonStatusResult;
import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.ProjectResource;
import com.br.superlogic.songcommunityfactory.domain.model.Workspace;
import com.br.superlogic.songcommunityfactory.domain.model._interface.Resource;
import java.util.List;
import com.br.superlogic.songcommunityfactory.domain.service.ResourceComparisonService;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import org.apache.commons.io.FileUtils;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Diego
 */
@Service("resourceComparisonService")
@Transactional
public class ResourceComparisonServiceImpl implements ResourceComparisonService
{

    @Autowired
    @Qualifier("workspaceDao")
    private WorkspaceDao workspaceDao;

    @Override
    public boolean isEqual(Resource r1, Resource r2) throws IOException
    {
        File file1 = new File(r1.getPath());
        File file2 = new File(r2.getPath());
        return FileUtils.contentEquals(file1, file2);
    }

    @Override
    public ComparisonStatusResult getComparisonStatus(Resource find, List<? extends Resource> inList) throws IOException
    {
        ComparisonStatusResult statusresult = new ComparisonStatusResult();
        statusresult.setWanted(find);

        for (Resource actual : inList)
        {
            if (isEqual(find, actual))
            {
                if (find.getName().equals(actual.getName()))
                {
                    statusresult.setStatus(ComparisonStatus.EQUAL);
                }
                else
                {
                    statusresult.setStatus(ComparisonStatus.DIFFERENT_NAME);
                }
                statusresult.setFound(actual);
                return statusresult;
            }
        }

        for (Resource actual : inList)
        {
            if (find.getName().equals(actual.getName()))
            {
                statusresult.setStatus(ComparisonStatus.DIFFERENT_CONTENT);
                statusresult.setFound(actual);
                return statusresult;
            }
        }

        statusresult.setStatus(ComparisonStatus.UNIQUE);
        return statusresult;
    }

    @Override
    public List<ComparisonStatusResult> getComparisonStatus(List<? extends Resource> wantedList, List<? extends Resource> inList) throws IOException
    {
        List<ComparisonStatusResult> statusList = new ArrayList<>();
        for (Resource resource : wantedList)
        {
            statusList.add(getComparisonStatus(resource, inList));
        }

        return statusList;
    }

    @Override
    public List<ComparisonStatusResult> getComparisonForWorkspaceRequestApprove(Long id) throws IOException
    {
        Workspace request = workspaceDao.get(id);
        Workspace principal = workspaceDao.getNewestPrincipal(request.getProject());
        List<ComparisonStatusResult> list = getComparisonStatus(request.getResources(), principal.getResources());
                
        for (Resource principalResource : principal.getResources())
        {
            boolean found = false;
            for (ComparisonStatusResult comparisonStatusResult : list)
            {
                if(principalResource.equals(comparisonStatusResult.getFound()))
                    found = true;
            }
            if(!found)
            {
                ComparisonStatusResult statusresult = new ComparisonStatusResult();
                statusresult.setStatus(ComparisonStatus.REVERSE_UNIQUE);
                statusresult.setWanted(principalResource);
                list.add(statusresult);
            }
        }
        
        return list;
    }

}
