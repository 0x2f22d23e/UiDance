AdamFile("M:/Class");

U0 UiDrawIt(CTask* t, CDC* dc)
{
    if (!t || !t->user_data) {
        return;
    }

    DCAnimationBuffer* ab = t->user_data;

    CDC frame;
    frame.width = ab->width;
    frame.width_internal = ab->width_internal;
    frame.height = ab->height;

    I64 len = ab->width_internal * ab->height;
    frame.body = ab->data + (ab->index++ * len);

    GrBlot(dc, (t->pix_width / 2) - (frame.width / 2), t->pix_height - frame.height, &frame);
    if (ab->index >= ab->count) {
        ab->index = 0;
    }
}

U64 UiSpawn()
{
    DCAnimationBuffer* ab = CAlloc(sizeof(DCAnimationBuffer));
    MemCpy(ab, ui_af, sizeof(DCAnimation));
    ab->data = &ui_af->data;
    return ab;
}

U0 UiDance()
{
    Fs->user_data = UiSpawn;
    Fs->draw_it = &UiDrawIt;
}

U0 UiStop()
{
    Fs->draw_it = NULL;
    if (Fs->user_data) {
        Free(Fs->user_data);
        Fs->user_data = NULL;
    }
}

UiDance;
