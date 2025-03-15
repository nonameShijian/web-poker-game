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
import com.webPokerGame.domain.PokerUserGameInfo;
import com.webPokerGame.service.IPokerUserGameInfoService;
import com.webPokerGame.common.utils.poi.ExcelUtil;
import com.webPokerGame.common.core.page.TableDataInfo;

/**
 * 用护胜负情况Controller
 * 
 * @author lwy
 * @date 2025-03-15
 */
@RestController
@RequestMapping("/userGameInfo/userGameInfo")
public class PokerUserGameInfoController extends BaseController
{
    @Autowired
    private IPokerUserGameInfoService pokerUserGameInfoService;

    /**
     * 查询用护胜负情况列表
     */
    @PreAuthorize("@ss.hasPermi('userGameInfo:userGameInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(PokerUserGameInfo pokerUserGameInfo)
    {
        startPage();
        List<PokerUserGameInfo> list = pokerUserGameInfoService.selectPokerUserGameInfoList(pokerUserGameInfo);
        return getDataTable(list);
    }

    /**
     * 导出用护胜负情况列表
     */
    @PreAuthorize("@ss.hasPermi('userGameInfo:userGameInfo:export')")
    @Log(title = "用护胜负情况", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PokerUserGameInfo pokerUserGameInfo)
    {
        List<PokerUserGameInfo> list = pokerUserGameInfoService.selectPokerUserGameInfoList(pokerUserGameInfo);
        ExcelUtil<PokerUserGameInfo> util = new ExcelUtil<PokerUserGameInfo>(PokerUserGameInfo.class);
        util.exportExcel(response, list, "用护胜负情况数据");
    }

    /**
     * 获取用护胜负情况详细信息
     */
    @PreAuthorize("@ss.hasPermi('userGameInfo:userGameInfo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(pokerUserGameInfoService.selectPokerUserGameInfoById(id));
    }

    /**
     * 新增用护胜负情况
     */
    @PreAuthorize("@ss.hasPermi('userGameInfo:userGameInfo:add')")
    @Log(title = "用护胜负情况", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PokerUserGameInfo pokerUserGameInfo)
    {
        return toAjax(pokerUserGameInfoService.insertPokerUserGameInfo(pokerUserGameInfo));
    }

    /**
     * 修改用护胜负情况
     */
    @PreAuthorize("@ss.hasPermi('userGameInfo:userGameInfo:edit')")
    @Log(title = "用护胜负情况", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PokerUserGameInfo pokerUserGameInfo)
    {
        return toAjax(pokerUserGameInfoService.updatePokerUserGameInfo(pokerUserGameInfo));
    }

    /**
     * 删除用护胜负情况
     */
    @PreAuthorize("@ss.hasPermi('userGameInfo:userGameInfo:remove')")
    @Log(title = "用护胜负情况", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(pokerUserGameInfoService.deletePokerUserGameInfoByIds(ids));
    }
}
