class DCAnimation {
    I32 count;
    I32 index;
    I32 width;
    I32 width_internal;
    I32 height;
};

class DCAnimationFile : DCAnimation {
    U8 data;
};

class DCAnimationBuffer : DCAnimation {
    U8* data;
};

DCAnimationFile* ui_af = FileRead("M:/Ui.BIN.Z");
