package com.railway.TicketManagement.service;

import com.railway.TicketManagement.dto.UserDTO;

public interface UserService {

    UserDTO registerUser(UserDTO userDTO);

    UserDTO login(String email, String password);

    UserDTO getUserById(Long userId);
}

