package com.training.framework.config;

import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.training.common.config.TrainingConfig;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;
import org.springframework.stereotype.Component;

import java.nio.charset.Charset;

/**
 * 防止redisKey重复冲突
 */
@Component
public class RedisKeySerializer implements RedisSerializer<String> {

    @Autowired
    private TrainingConfig config;

    private final Charset charset;

    public RedisKeySerializer()
    {
        this(Charset.forName("UTF8"));
    }

    public RedisKeySerializer(Charset charset)
    {
        Assert.notNull(charset, "字符集不允许为NULL");
        this.charset = charset;
    }

    @Override
    public byte[] serialize(String string) throws SerializationException
    {
        // 通过项目名称ruoyi.name来定义Redis前缀，用于区分项目缓存
        if (StringUtils.isNotEmpty(config.getName()))
        {
            return new StringBuilder(config.getName()).append(":").append(string).toString().getBytes(charset);
        }
        return string.getBytes(charset);
    }

    @Override
    public String deserialize(byte[] bytes) throws SerializationException
    {
        return (bytes == null ? null : new String(bytes, charset));
    }

}
