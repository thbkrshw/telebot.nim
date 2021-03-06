import types, json, strutils, utils, options

proc `$`*(m: InputMedia): string =
    result = ""
    if m of InputMediaPhoto:
        var photo = InputMediaPhoto(m)
        photo.kind = "photo"
        marshal(photo[], result)
    elif m of InputMediaVideo:
        var video = InputMediaVideo(m)
        marshal(video[], result)
    elif m of InputMediaAudio:
        var audio = InputMediaAudio(m)
        marshal(audio[], result)
    elif m of InputMediaAnimation:
        var animation = InputMediaAnimation(m)
        marshal(animation[], result)
    elif m of InputMediaDocument:
        var document = InputMediaDocument(m)
        marshal(document[], result)
proc newInputMediaPhoto*(media: string, caption = "", parseMode = ""): InputMediaPhoto =
    new(result)
    result.kind = "photo"
    result.media = media
    if caption.len > 0:
        result.caption = some(caption)
    if parseMode.len > 0:
        result.parseMode = some(parseMode)

proc newInputMediaVideo*(media: string, caption = "", parseMode = ""): InputMediaVideo =
    new(result)
    result.kind = "video"
    result.media = media
    if caption.len > 0:
        result.caption = some(caption)
    if parseMode.len > 0:
        result.parseMode = some(parseMode)