from rest_framework.permissions import BasePermission


class IsAdminOrReadOnly(BasePermission):
    """
    Anyone can view products and categories.
    Only admin/staff users can create, update, or delete.
    """

    def has_permission(self, request, view):

        # GET, HEAD and OPTIONS are allowed for everyone
        if request.method in ["GET", "HEAD", "OPTIONS"]:
            return True

        # POST, PUT, PATCH and DELETE require admin/staff access
        return (
            request.user.is_authenticated
            and request.user.is_staff
        )