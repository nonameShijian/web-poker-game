package com.webPokerGame.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.webPokerGame.common.annotation.Log;
import com.webPokerGame.common.core.controller.BaseController;
import com.webPokerGame.common.core.domain.AjaxResult;
import com.webPokerGame.common.enums.BusinessType;
import com.webPokerGame.domain.PokerRaceInfo;
import com.webPokerGame.service.IPokerRaceInfoService;
import com.webPokerGame.common.utils.poi.ExcelUtil;
import com.webPokerGame.common.core.page.TableDataInfo;

/**
 * 历史比赛信息Controller
 * 
 * @author lwy
 * @date 2025-03-15
 */
@RestController
@RequestMapping("/raceInfoAdmin/raceInfoAdmin")
public class PokerRaceInfoController extends BaseController
{
    @Autowired
    private IPokerRaceInfoService pokerRaceInfoService;

    /**
     * 查询历史比赛信息列表
     */
    @PreAuthorize("@ss.hasPermi('raceInfoAdmin:raceInfoAdmin:list')")
    @GetMapping("/list")
    public TableDataInfo list(PokerRaceInfo pokerRaceInfo)
    {
        startPage();
        List<PokerRaceInfo> list = pokerRaceInfoService.selectPokerRaceInfoList(pokerRaceInfo);
        return getDataTable(list);
    }

    /**
     * 导出历史比赛信息列表
     */
    @PreAuthorize("@ss.hasPermi('raceInfoAdmin:raceInfoAdmin:export')")
    @Log(title = "历史比赛信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PokerRaceInfo pokerRaceInfo)
    {
        List<PokerRaceInfo> list = pokerRaceInfoService.selectPokerRaceInfoList(pokerRaceInfo);
        ExcelUtil<PokerRaceInfo> util = new ExcelUtil<PokerRaceInfo>(PokerRaceInfo.class);
        util.exportExcel(response, list, "历史比赛信息数据");
    }

    /**
     * 获取历史比赛信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('raceInfoAdmin:raceInfoAdmin:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(pokerRaceInfoService.selectPokerRaceInfoById(id));
    }

    /**
     * 新增历史比赛信息
     */
    @PreAuthorize("@ss.hasPermi('raceInfoAdmin:raceInfoAdmin:add')")
    @Log(title = "历史比赛信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PokerRaceInfo pokerRaceInfo)
    {
        return toAjax(pokerRaceInfoService.insertPokerRaceInfo(pokerRaceInfo));
    }

    /**
     * 修改历史比赛信息
     */
    @PreAuthorize("@ss.hasPermi('raceInfoAdmin:raceInfoAdmin:edit')")
    @Log(title = "历史比赛信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PokerRaceInfo pokerRaceInfo)
    {
        return toAjax(pokerRaceInfoService.updatePokerRaceInfo(pokerRaceInfo));
    }

    /**
     * 删除历史比赛信息
     */
    @PreAuthorize("@ss.hasPermi('raceInfoAdmin:raceInfoAdmin:remove')")
    @Log(title = "历史比赛信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(pokerRaceInfoService.deletePokerRaceInfoByIds(ids));
    }
}
