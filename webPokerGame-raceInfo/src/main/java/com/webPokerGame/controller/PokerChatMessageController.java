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
import com.webPokerGame.domain.PokerChatMessage;
import com.webPokerGame.service.IPokerChatMessageService;
import com.webPokerGame.common.utils.poi.ExcelUtil;
import com.webPokerGame.common.core.page.TableDataInfo;

/**
 * 游戏房间聊天记录Controller
 * 
 * @author lwy
 * @date 2025-05-25
 */
@RestController
@RequestMapping("/message/messageAdmin")
public class PokerChatMessageController extends BaseController
{
    @Autowired
    private IPokerChatMessageService pokerChatMessageService;

    /**
     * 查询游戏房间聊天记录列表
     */
    @PreAuthorize("@ss.hasPermi('message:messageAdmin:list')")
    @GetMapping("/list")
    public TableDataInfo list(PokerChatMessage pokerChatMessage)
    {
        startPage();
        List<PokerChatMessage> list = pokerChatMessageService.selectPokerChatMessageList(pokerChatMessage);
        return getDataTable(list);
    }

    /**
     * 导出游戏房间聊天记录列表
     */
    @PreAuthorize("@ss.hasPermi('message:messageAdmin:export')")
    @Log(title = "游戏房间聊天记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PokerChatMessage pokerChatMessage)
    {
        List<PokerChatMessage> list = pokerChatMessageService.selectPokerChatMessageList(pokerChatMessage);
        ExcelUtil<PokerChatMessage> util = new ExcelUtil<PokerChatMessage>(PokerChatMessage.class);
        util.exportExcel(response, list, "游戏房间聊天记录数据");
    }

    /**
     * 获取游戏房间聊天记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('message:messageAdmin:query')")
    @GetMapping(value = "/{messageId}")
    public AjaxResult getInfo(@PathVariable("messageId") Long messageId)
    {
        return success(pokerChatMessageService.selectPokerChatMessageByMessageId(messageId));
    }

    /**
     * 新增游戏房间聊天记录
     */
    @PreAuthorize("@ss.hasPermi('message:messageAdmin:add')")
    @Log(title = "游戏房间聊天记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PokerChatMessage pokerChatMessage)
    {
        return toAjax(pokerChatMessageService.insertPokerChatMessage(pokerChatMessage));
    }

    /**
     * 修改游戏房间聊天记录
     */
    @PreAuthorize("@ss.hasPermi('message:messageAdmin:edit')")
    @Log(title = "游戏房间聊天记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PokerChatMessage pokerChatMessage)
    {
        return toAjax(pokerChatMessageService.updatePokerChatMessage(pokerChatMessage));
    }

    /**
     * 删除游戏房间聊天记录
     */
    @PreAuthorize("@ss.hasPermi('message:messageAdmin:remove')")
    @Log(title = "游戏房间聊天记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{messageIds}")
    public AjaxResult remove(@PathVariable Long[] messageIds)
    {
        return toAjax(pokerChatMessageService.deletePokerChatMessageByMessageIds(messageIds));
    }
}
