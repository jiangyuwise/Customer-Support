package com.codve;

import lombok.Data;

@Data
public class Attachment {
    private String name;
    private byte[] contents;
}