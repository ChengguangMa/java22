package com.kaishengit.web.user;


import com.kaishengit.dto.JsonResult;
import com.kaishengit.entity.Topic;
import com.kaishengit.entity.User;
import com.kaishengit.service.TopicService;
import com.kaishengit.util.StringUtils;
import com.kaishengit.web.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/topicTk")
public class ThankServlet extends BaseServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String topicid=req.getParameter("topicid");
        String variable=req.getParameter("variable");
        User user=getCurrentUser(req);

        TopicService topicService=new TopicService();
        JsonResult jsonResult=new JsonResult();

        if(StringUtils.isNumeric(topicid)&&StringUtils.isNotEmpty(variable)){
            if(variable.equals("th")){
                topicService.thankTopic(user,topicid);
                jsonResult.setState(JsonResult.SUCCESS);
            }else {
                topicService.unthankTopic(user,topicid);
                jsonResult.setState(JsonResult.SUCCESS);
            }


            Topic topic=topicService.findTopicById(topicid);
            jsonResult.setData(topic.getThankyounum());

        }else {
            jsonResult.setMessage("参数异常");
        }
            renderJSON(jsonResult,resp);

    }



}
