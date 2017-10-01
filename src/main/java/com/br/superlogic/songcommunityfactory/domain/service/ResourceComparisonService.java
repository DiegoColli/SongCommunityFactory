package com.br.superlogic.songcommunityfactory.domain.service;

import com.br.superlogic.songcommunityfactory.domain.model.util.ComparisonStatusResult;
import com.br.superlogic.songcommunityfactory.domain.model._interface.Resource;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface ResourceComparisonService
{

    public boolean isEqual(Resource r1, Resource r2) throws IOException;

    public ComparisonStatusResult getComparisonStatus(Resource find, List<? extends Resource> inList) throws IOException;

    public List<ComparisonStatusResult> getComparisonStatus(List<? extends Resource> wantedList, List<? extends Resource> inList) throws IOException;

    public List<ComparisonStatusResult> getComparisonForWorkspaceRequestApprove(Long id) throws IOException;
}
