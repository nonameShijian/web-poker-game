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
import com.webPokerGame.domain.PokerRoom;
import com.webPokerGame.service.IPokerRoomService;
import com.webPokerGame.common.utils.poi.ExcelUtil;
import com.webPokerGame.common.core.page.TableDataInfo;

/**
 * 游戏房间信息Controller
 * 
 * @author lwy
 * @date 2025-05-25
 */
@RestController
@RequestMapping("/room/roomAdmin")
public class PokerRoomController extends BaseController
{
    @Autowired
    private IPokerRoomService pokerRoomService;

    /**
     * 查询游戏房间信息列表
     */
    @PreAuthorize("@ss.hasPermi('room:roomAdmin:list')")
    @GetMapping("/list")
    public TableDataInfo list(PokerRoom pokerRoom)
    {
        startPage();
        List<PokerRoom> list = pokerRoomService.selectPokerRoomList(pokerRoom);
        return getDataTable(list);
    }

    /**
     * 导出游戏房间信息列表
     */
    @PreAuthorize("@ss.hasPermi('room:roomAdmin:export')")
    @Log(title = "游戏房间信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PokerRoom pokerRoom)
    {
        List<PokerRoom> list = pokerRoomService.selectPokerRoomList(pokerRoom);
        ExcelUtil<PokerRoom> util = new ExcelUtil<PokerRoom>(PokerRoom.class);
        util.exportExcel(response, list, "游戏房间信息数据");
    }

    /**
     * 获取游戏房间信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('room:roomAdmin:query')")
    @GetMapping(value = "/{roomId}")
    public AjaxResult getInfo(@PathVariable("roomId") Long roomId)
    {
        return success(pokerRoomService.selectPokerRoomByRoomId(roomId));
    }

    /**
     * 新增游戏房间信息
     */
    @PreAuthorize("@ss.hasPermi('room:roomAdmin:add')")
    @Log(title = "游戏房间信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PokerRoom pokerRoom)
    {
        return toAjax(pokerRoomService.insertPokerRoom(pokerRoom));
    }

    /**
     * 修改游戏房间信息
     */
    @PreAuthorize("@ss.hasPermi('room:roomAdmin:edit')")
    @Log(title = "游戏房间信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PokerRoom pokerRoom)
    {
        return toAjax(pokerRoomService.updatePokerRoom(pokerRoom));
    }

    /**
     * 删除游戏房间信息
     */
    @PreAuthorize("@ss.hasPermi('room:roomAdmin:remove')")
    @Log(title = "游戏房间信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{roomIds}")
    public AjaxResult remove(@PathVariable Long[] roomIds)
    {
        return toAjax(pokerRoomService.deletePokerRoomByRoomIds(roomIds));
    }
}
