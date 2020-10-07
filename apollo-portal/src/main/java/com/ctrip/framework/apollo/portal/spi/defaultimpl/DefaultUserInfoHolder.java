package com.ctrip.framework.apollo.portal.spi.defaultimpl;

import com.ctrip.framework.apollo.portal.spi.UserInfoHolder;
import com.ctrip.framework.apollo.portal.entity.bo.UserInfo;

/**
 * 不是ctrip的公司默认提供一个假用户
 */
public class DefaultUserInfoHolder implements UserInfoHolder {


  public DefaultUserInfoHolder() {

  }

  @Override
  public UserInfo getUser() {
    UserInfo userInfo = new UserInfo();
    userInfo.setUserId("apollo");
    userInfo.setEmail("apollo_xl_local_test@test.com");
    userInfo.setName("谢凌本地测试用户姓名");
    return userInfo;
  }
}
